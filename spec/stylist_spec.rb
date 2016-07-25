require 'spec_helper'
describe Stylist do

  describe '.all' do
    it 'returns all stylists in database' do
    expect(Stylist.all).to(eq([]))
    end
  end

  describe '#save' do
    it 'saves a stylist to database' do
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

  describe '#id' do
    it "returns the id of the stylist" do
      test_stylist = Stylist.new({:name => 'Opal Essence', :contact => '8089998989'})
      test_stylist.save()
      expect(test_stylist.id.class).to(eq(Fixnum))
    end
  end

  describe '#name' do
    it "returns the stylist's name" do
      test_stylist = Stylist.new({:name => 'Opal Essence', :contact => '8089998989'})
      expect(test_stylist.name()).to(eq('Opal Essence'))
    end
  end

  describe '#contact' do
    it "returns the stylist's contact information" do
      test_stylist = Stylist.new({:name => 'Opal Essence', :contact => '8089998989'})
      expect(test_stylist.contact()).to(eq('8089998989'))
    end
  end

  describe '#delete' do
    it "deletes the stylist from the database" do
      test_stylist1 = Stylist.new({:name => 'Opal Essence', :contact => '8089998989'})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => 'Jammin', :contact => 'barkless@jammin.jm'})
      test_stylist2.save()
      test_stylist1.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

  describe '#find' do
    it "returns a stylist by their id" do
      test_stylist1 = Stylist.new({:name => 'Opal Essence', :contact => '8089998989'})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => 'Jammin', :contact => 'barkless@jammin.jm'})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe "#update" do
    it "changes the attribute of a stylist" do
      test_stylist = Stylist.new({:name => "Phil Erup", :contact => "embarrasing_email@yahoo.com", :id => nil})
      test_stylist.save()
      test_stylist.update({:contact => "7772420101"})
      expect(test_stylist.name()).to(eq("Phil Erup"))
      expect(test_stylist.contact()).to(eq("7772420101"))
    end
  end

  describe "#clients" do
    it "returns the clients of a stylist" do
      test_stylist = Stylist.new({:name => "Phil Erup", :contact => "embarrasing_email@yahoo.com", :id => nil})
      test_stylist.save()
      test_client1 = Client.new({:name => "Grace Hopper", :id => nil, :stylist_id => stylist.id()})
      test_client1.save()
      test_client2 = Client.new({:name => "Ada Lovelace", :id => nil, :stylist_id => stylist.id()})
      test_client2.save()
      test_client1.update({:stylist_id => stylist.id()})
      test_client2.update({:stylist_id => stylist.id()})
      expect(stylist.clients()).to(eq([test_client1, test_client2]))
    end
  end

end
