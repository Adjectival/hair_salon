require 'spec_helper'
describe Client do

  describe '.all' do
    it "returns an array of all clients" do
      test_client1 = Client.new({:name => 'Marv Harvey', :contact => '7215035533', :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:name => 'Harv Marvey', :contact => '7215033355', :stylist_id => 1})
      test_client2.save()
      expect(Client.all()).to(eq([test_client1, test_client2]))
    end
  end

  describe '#save' do
    it "saves a client into the database" do
      test_client1 = Client.new({:name => 'Marv Harvey', :contact => '7215035533', :stylist_id => 1})
      test_client1.save()
      expect(Client.all()).to(eq([test_client1]))
    end
  end

  describe '#==' do
    it "compares two clients to see if they are the same person" do
      test_client1 = Client.new({:name => 'Marv Harvey', :contact => '7215035533', :stylist_id => 1})
      test_client2 = Client.new({:name => 'Marv Harvey', :contact => '7215035533', :stylist_id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe '#delete' do
    it "deletes the client from the app" do
      test_client1 = Client.new({:name => 'No Num Berwon', :contact => '2342342345', :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:name => 'After Words', :contact => '10010010@x0x.90', :stylist_id => 2})
      test_client2.save()
      test_client1.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end

  describe '#id' do
    it "returns the id of the client" do
      test_client = Client.new({:name => 'Harshbud Jawns', :contact => 'hbudzj@me.com', :stylist_id => 2})
      test_client.save()
      expect(test_client.id.class).to(eq(Fixnum))
    end
  end

  describe '#name' do
    it "returns the client's name" do
      test_client = Client.new({:name => 'Harshbud Jawns', :contact => 'hbudzj@me.com', :stylist_id => 2})
      test_client.save()
      expect(test_client.name()).to(eq('Harshbud Jawns'))
    end
  end

  describe '#contact' do
    it "returns the client's contact information" do
      test_client = Client.new({:name => 'Harshbud Jawns', :contact => 'hbudzj@me.com', :stylist_id => 2})
      test_client.save()
      expect(test_client.contact()).to(eq('hbudzj@me.com'))
    end
  end

  describe '#stylist_id' do
    it "returns the client's stylist's id" do
      test_client = Client.new({:name => 'Harshbud Jawns', :contact => 'hbudzj@me.com', :stylist_id => 2})
      test_client.save()
      expect(test_client.stylist_id()).to(eq(2))
    end
  end

  describe '#find' do
    it "returns a client by their id" do
      test_client3 = Client.new({:name => 'Harshbud Jawns', :contact => 'hbudzj@me.com', :stylist_id => 2})
      test_client3.save()
      test_client1 = Client.new({:name => 'No Num Berwon', :contact => '2342342345', :stylist_id => 1})
      test_client1.save()
      expect(Client.find(test_client3.id())).to(eq(test_client3))
    end
  end

  describe '#update' do
    it "changes the attributes of a client" do
      test_client = Client.new({:name => 'No Num Berwon', :contact => '2342342345', :stylist_id => 1})
      test_client.save()
      test_client.update(:contact => '1111111110')
      expect(test_client.name()).to(eq('No Num Berwon'))
      expect(test_client.contact()).to(eq('1111111110'))
    end
  end

end
