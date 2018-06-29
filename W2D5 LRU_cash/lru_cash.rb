class LRUCache
    def initialize(size) # size ultimate
      @size = size
      # @first = nil
      @cash_liste = []
    end

    def count
      # returns number of elements currently in cache
      @cash_list.size
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cash_liste.include?(el)
        @cash_list.delete(el)
        @cash_list.add(el)
      elsif count>= @size
        @cash_list.shift
        @cash_list<<el
      else
        @cash_list<<el
      end


    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cash_list
    end

    private
    # helper methods go here!

  end



#solution:
# class LRUCache
#   def initialize(size)
#     @size = size
#     @cache = []
#   end
#
#   def count
#     @cache.count
#   end
#
#   def add(el)
#     if @cache.include?(el)
#       @cache.delete(el)
#       @cache << el
#     elsif count >= @size
#       @cache.shift
#       @cache << el
#     else
#       @cache << el
#     end
#   end
#
#   def show
#     p @cache
#     nil
#   end   #?? why 
# end
