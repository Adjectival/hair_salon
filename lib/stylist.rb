class Stylist
  attr_reader(:id, :name, :contact)

  define_method (:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes.fetch(:name)
    @contact = attributes.fetch(:contact)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT id, name, contact FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist.fetch('id').to_i()
      name = stylist.fetch('name')
      contact = stylist.fetch('contact')
      stylists << Stylist.new({:id => id, :name => name, :contact => contact})
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name, contact) VALUES ('#{@name}','#{@contact}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end
  define_method(:==) do |other|
    (self.id() == other.id()&&(self.name() == other.name()&&(self.contact() == other.contact())))
  end

end
