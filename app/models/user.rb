class User < ApplicationRecord
  def level_view(set_level)
    user = User.
    joins('JOIN user_profiles ON user_profiles.name = users.name').
    joins('JOIN tests ON tests.id = user_profiles.test_id').
    where("tests.level = ?", set_level).
    pluck('tests.title')
  end
end
