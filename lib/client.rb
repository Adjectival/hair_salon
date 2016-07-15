class Client
  attr_reader(:id, :name, :contact, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes.fetch(:name)
    @contact = attributes.fetch(:contact)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT id, name, contact, stylist_id FROM clients;")
    clients = []
    returned_clients.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      contact = client.fetch('contact')
      stylist_id = client.fetch('stylist_id')
      clients << Client.new({:id => id, :name => name, :contact => contact, :stylist_id => stylist_id})
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name,contact,stylist_id) VALUES ('#{@name}','#{@contact}','#{@stylist_id}') RETURNING id")
    @id = result.first.fetch('id').to_i()
  end
  define_method(:==) do |other|
    (self.id() == other.id()&&(self.name() == other.name()&&(self.contact() == other.contact())))
  end

end
