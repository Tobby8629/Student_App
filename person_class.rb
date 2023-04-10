class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def of_age?
    @age >= 18
  end

  def can_use_service?
    return unless of_age? || @parent_permission

    true
  end

  private :is_Of_Age
end
