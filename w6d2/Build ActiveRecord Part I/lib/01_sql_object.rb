require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |column|
        define_method(column) do
          self.attributes[column]
        end

        define_method("#{column}=") do |value|
          self.attributes[column] = value
        end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= "#{self}".tableize
  end

  def self.all
    # ...
    show = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
       #{table_name}
    SQL

    parse_all(show)

  end

  def self.parse_all(results)
    # ...
    results.map do |hash|
      self.new(hash)
    end

  end

  def self.find(id)
    # ...
    self.all.find { |obj| obj.id == id}
  end

  def initialize(params = {})
    # ...
      params.each do |attr_name, value|
        if self.class.columns.include?(attr_name.to_sym)
          self.send("#{attr_name.to_sym}=", value) 
        else
          raise "unknown attribute '#{attr_name}'"
        end
      end
  end

  def attributes
    # ...
    @attributes ||= {}

  end

  def attribute_values
    # ...
    self.attributes.keys
  end

  def insert
    # ...
    col_names = self.class.columns.join(',')
    question_marks = ['?'] * self.class.columns.length
    DBConnection.execute(<<-SQL)
    INSERT INTO
      #{self.table_name}
    VALUES

  end

  def update
    # ...
  end

  def save
    # ...
  end
end
