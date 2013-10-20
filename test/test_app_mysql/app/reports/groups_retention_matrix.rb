puts "report file -------"
ActiveMetrics.report do
  define_segment :weeks do
    (0..7).map do |n|
      n.weeks.ago.beginning_of_week
    end.sort
  end

  define_kpi :users_registered do |current_segment|
    User.where("created_at BETWEEN ? AND ?", current_segment, current_segment.end_of_week).to_a
  end

  define_kpi :users_active_after_n_week do |current_segment|
    users = ActiveMetrics::KPIs.get(:users_registered, current_segment)

    (0..4).map do |n|
      Articlehistory.where(user_id: users.map(&:id))
          .where("created_at BETWEEN ? AND ?",
                  current_segment + n.weeks,
                  current_segment.end_of_week + (n).weeks)
          .map(&:user_id).uniq
    end
  end

  cohort_table 'Retention Matrix' do
    display      [:users_registered, :users_active_after_n_week]
    segment_by   :weeks
    # based_on     :group
    # aggregate_by :company
  end
end
