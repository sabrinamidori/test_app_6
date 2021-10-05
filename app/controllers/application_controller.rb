class ApplicationController < ActionController::Base
    def hello
        render html: "Hello world!!! Thank you, Universe!"
    end
end
