require 'rails_helper'

describe User do
  # creating a user and setting it as subject for rspec
  subject { User.create(email: "foo@foo.com", password: "12345678") }

  # some example bookings for tests
  let(:booking1) { Booking.create(start_time: Date.today) }
  let(:booking2) { Booking.create(start_time: Date.today) }
  let(:booking3) { Booking.create(start_time: Date.today) }
  let(:booking4) { Booking.create(start_time: 1.day.from_now) }

  # this adds expets a booking to be true
  context "#add_booking" do
    it "adds one booking" do
      expect(subject.add_booking(booking1)).to eq true
    end

    it "adds two bookings" do
      subject.add_booking(booking1)
      expect(subject.add_booking(booking2)).to eq true
    end

    it "does not add a booking if two are already the same day" do
      subject.add_booking(booking1)
      subject.add_booking(booking2)
      expect(subject.add_booking(booking3)).to eq false
    end

    it "if add a booking not the sme day" do
      subject.add_booking(booking1)
      subject.add_booking(booking2)
      expect(subject.add_booking(booking4)).to eq true
    end
  end
end
