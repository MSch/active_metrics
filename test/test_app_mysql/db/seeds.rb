# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Todo.delete_all

58.downto(0) do |day|
  1.upto(58 - day) do |i|
    User.create!(created_at: (Time.zone.now - day.days))
  end
end


User.all.each do |user|
  coin_flip = Random.rand
  will_never_churn = coin_flip < 0.05

  user.created_at.to_date.upto(Time.zone.now.to_date) do |date|
    random = Random.rand
    if random > 0.65
      user.todos.create!(created_at: date)
    end
    if random > 0.9
      user.todos.create!(created_at: date + 3.hours)
    end
    unless will_never_churn
      if random < 0.1
        break
      end
    end
  end
end
