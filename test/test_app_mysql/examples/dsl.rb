ActiveMetrics.report do
  define_segment :registration_week do
    (0..10).map do |n|
      n.weeks.ago.beginning_of_week
    end
  end

  define_kpi :users_registered do |current_segment|
    User.where("created_at BETWEEN ? AND ?", current_segment, current_segment + 1.week)
  end

  define_kpi :users_active_after_n_week do |current_segment|
    users = KPIs.get(:users_registered, current_segment)

    (0..5).map do |n|
      Todo.where(user_id: users.map(&:id)).where("created_at BETWEEN ? AND ?", current_segment + n.weeks, current_segment + (n + 1).weeks)
    end
  end

  cohort_table 'Retention Matrix' do
    display      :users_registered, :users_active_after_n_week
    segment_by   :registration_week
    # based_on     :user
    # aggregate_by :company
  end
end
