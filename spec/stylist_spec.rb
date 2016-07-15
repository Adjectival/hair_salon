require 'spec_helper'
describe Stylist do

  describe '.all' do
    it 'returns an array of all stylists' do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe '#save' do
    it 'saves a stylist to an array of all stylists' do
      new_hire = Stylist.new({:name => 'DanaLeigh', :contact => 'DLgeepers@me.com'})
      new_hire.save()
      expect(Stylist.all()).to(eq([new_hire]))
    end
  end

  describe '#==' do
    it "compares two stylists to see if they are the same person" do
      test_stylist1 = Stylist.new({:id => 1, :name => 'DanaLeigh', :contact => 'DLgeepers@me.com'})
      test_stylist2 = Stylist.new({:id => 1, :name => 'DanaLeigh', :contact => 'DLgeepers@me.com'})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

end
