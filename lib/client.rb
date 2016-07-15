class Client
  attr_reader(:id, :name, :contact)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes.fetch(:name)
    @contact = attributes.fetch(:contact)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT id, name, contact FROM clients;")
    clients = []
    returned_clients.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      contact = client.fetch('contact')
      clients << Client.new({:id => id, :name => name, :contact => contact})
    end
    clients
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name,contact) VALUES ('#{@name}','#{@contact}') RETURNING id")
    @id = result.first.fetch('id').to_i()
  end
  define_method(:==) do |other|
    (self.id() == other.id()&&(self.name() == other.name()&&(self.contact() == other.contact())))
  end

end
