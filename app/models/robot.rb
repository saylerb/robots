class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @city = data["city"]
    @state = data["state"]
    @avatar = "https://robohash.org/#{@name+@id.to_s}.png?size=300x300"
    @birthdate = data["birthdate"]
    @date_hired = data["date_hired"]
    @department = data["department"]
  end
end
