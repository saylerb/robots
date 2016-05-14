class Robot
  attr_reader :id,
              :name,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @state = data[:state]
    @avatar = data[:avatar]
    @birthdate = data[:birthdate]
    @date_hired = data[:date_hired]
    @department = data[:department]
  end
end
