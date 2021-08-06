require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it {should have_many(:bookings)}
  it {should have_many(:flights).through(:bookings)}
end
