class User
  # id, name, email, password
  # mobile_number, avatar, sex
  
  # Redis 
  # users:count -> incr
  # user:id nickname, email, password
  # email.to.id email => id, 防止重复邮箱注册
  
  # TODO: cookie 持久化 && 多server共享
  # FIXME: 在save之前不应该分配id
  
  attr_reader :id

  def initialize(redis_server, new_user = {})
    @redis_server = redis_client
    if new_user[:id]
      @id = new_user[:id]
    else
      @id = -1
    end
  end

  def save
    @id = @redis_server.incr "users:count" if @id == -1
    @redis_server.hmset("user:#{@id}", {nickname: nickname, email: email, password: password})
  end

  def self.auth
  end
end
