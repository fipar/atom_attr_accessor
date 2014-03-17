class Class
  def atom_attr_accessor(*args)
    self.class_eval("
require 'java'
require 'clojure-1.5.1.jar'
java_import 'clojure.lang.LockingTransaction'
java_import 'clojure.lang.Atom'
")

    args.each do |arg|
      self.class_eval("
def #{arg}
   @#{arg}.deref unless @#{arg}.nil? 
end

def #{arg}=(val)
   if @#{arg}.nil?
      @#{arg} = Atom.new(val) 
   else
      @#{arg}.reset val
   end
end
")
      
    end 
  end
end


