class ApplicationController < ActionController::Base
    def hello
        render html: "¡hola, ajiea!"
    end


    def goodbye
        render html: "bye wolrd"
    end
end
