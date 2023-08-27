require "socket"
require "../Lesson_5_ClassesAndModules/CashMachine.rb"

server = TCPServer.open("0.0.0.0", 3000)

while connection = server.accept
  request = connection.gets

  method, full_path, protocol = request.split(" ")
  path, params = full_path.split("?")
  params = params.split("&").map { |pair| pair.split("=")}.to_h

  puts method
  puts path
  puts protocol
  puts params["method"]
  puts params["value"]

  response = case path
  when "/"
    "Hello, world!"
  when "/user"
    "Hello, user!"

  when "/balance"
    cash_machine = CashMachine.new(500) 
    "#{cash_machine.current_balance}"

    case params["method"]
    when "deposit"
      cash_machine.increase_balance(params["value"])
    when "withdraw" 
      cash_machine.decrease_balance(params["value"])      
    #else    
      #cash_machine.current_balance
    end 
  else
    "404"
  end
  
  status  = response == "404" ? "404" : "200"

  connection.print "HTTP/1.1 #{status}\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"
  connection.print response
  
  connection.close
end  