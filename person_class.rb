require './decorate'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_service?
    return unless of_age? || @parent_permission

    true
  end

  def correct_name
    @name
  end

  private :of_age?
end
