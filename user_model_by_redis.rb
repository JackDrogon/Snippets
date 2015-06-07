class User
  # id, name, email, password
  # mobile_number, avatar, sex
  
  # Redis 
  # users:count -> incr
  # user:id nickname, email, password
  # email.to.id email => id, 防止重复邮箱注册
  
  attr_reader :id

  def initialize(redis_server, new_user = {})
    @redis_server = redis_client
    if new_user[:id]
      @id = id
    else
      @id = @redis_server.incr "users:count"
    end
  end

  def self.auth
  end
end
