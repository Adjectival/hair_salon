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

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name, contact) VALUES ('#{@name}','#{@contact}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
  define_method(:==) do |other|
    (self.id() == other.id()&&(self.name() == other.name()&&(self.contact() == other.contact())))
  end

  define_singleton_method(:find) do |tada|
    found_stylist = nil
    Stylist.all.each() do |stylist|
      if stylist.id() == (tada)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:update) do |attributes|
    @id = self.id()
    @name = attributes.fetch(:name, @name)
    @contact = attributes.fetch(:contact, @contact)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE stylists SET contact = '#{@contact}' WHERE id = #{@id};")
  end

end
