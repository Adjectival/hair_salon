require 'spec_helper'
describe Client do

  describe '.all' do
    it "returns an array of all clients" do
      test_client1 = Client.new({:id => 12, :name => 'Marv Harvey', :contact => '7215035533'})
      test_client1.save()
      test_client2 = Client.new({:id => 13, :name => 'Harv Marvey', :contact => '7215033355'})
      test_client2.save()
      expect(Client.all()).to(eq([test_client1,test_client2]))
    end
  end

  describe '#save' do
    it "saves a client into the database" do
      test_client1 = Client.new({:id => 12, :name => 'Marv Harvey', :contact => '7215035533'})
      test_client1.save()
      expect(Client.all()).to(eq([test_client1]))
    end
  end

  describe '#==' do
    it "compares two clients to see if they are the same person" do
      test_client1 = Client.new({:id => 12, :name => 'Marv Harvey', :contact => '7215035533'})
      test_client2 = Client.new({:id => 12, :name => 'Marv Harvey', :contact => '7215035533'})
      expect(test_client1).to(eq(test_client2))
    end
  end
end
