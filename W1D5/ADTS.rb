class Stack
  def initialize
    # create ivar to store stack here!
    @arr =[]
  end

  def push(el)
    # adds an element to the stack
    @arr.push(el)
  end

  def pop
    # removes one element from the stack
    @arr.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @arr.last
  end
end

stk = Stack.new
stk.push(5)
stk.push("a")
p stk.pop
p stk.peek

class Queue
  def initialize
    # create ivar to store
    @arr =[]
  end

  def enqueue(el)
    # adds an element
    @arr.push(el)
  end

  def dequeue
    # removes one element
    @arr.shift
  end

  def peek
    # returns, but doesn't remove
    @arr.first
  end
end

que = Queue.new
que.enqueue(5)
que.enqueue("a")
p que.dequeue
p que.peek

class Map
  def initialize
    # create ivar to store
    @arr =[[]]
  end

  def set(key, value)
    # adds an element
    @arr.each.with_index do |el,i|
      el[1] = value if el.first == key
    end
    @arr.push([key, value])
  end

  def get(key)
    # removes one element
    @arr.each do |el|
      return el.last if el.first == key
    end
  end

  def delete(key)
    @arr.reject{|el| el.first == key}
  end
  def show
    # returns, but doesn't remove
  end

  # def show
  #   deep_dup(@arr)
  # end
  #
  # private
  #
  # def deep_dup(arr)
  #   arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  # end
end

mp = Map.new
mp.set(4,3)
mp.set(4,5)
mp.set(7,8)
p mp.get(4)
mp.delete(4)
mp.show
