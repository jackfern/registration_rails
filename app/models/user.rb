class User

  def initialize(name, address, city, state, zipcode, country, email, username, password)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
    @country = country
    @email = email
    @username = username
    @password = password
    @phone = "No Phone"
  end

  def get_name
    @name
  end

  def get_address
    @address
  end

  def get_city
    @city
  end

  def get_state
    @state
  end

  def get_zipcode
    @zipcode
  end

  def get_country
    @country
  end

  def get_email
    @email
  end

  def get_username
    @username
  end

  def get_password
    @password
  end

  def assign_phone(number)
    @phone = number
  end

  def get_phone
    @phone
  end

  def assign_name(name)
    @name = name
  end

  def assign_address(address)
    @address = address
  end

  def assign_city(city)
    @city = city
  end

  def assign_state(state)
    @state = state
  end

  def assign_zipcode(zipcode)
    @zipcode = zipcode
  end

  def assign_country(country)
    @country = country
  end

  def assign_email(email)
    @email = email
  end

  def assign_username(username)
    @username = username
  end

  def assign_password(password)
    @password = password
  end

end
