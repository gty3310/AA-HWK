require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  
RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
