

class FakeRest
  def initialize
    
    @response = nil
    @lastBook = nil
    
  end
  
  def self.postBook
    
    request = CONFIG["URI"]
    
    header = {"Content-Type" => CONFIG["CONTENT-TYPE"],
               "Accept" => CONFIG["ACCEPT"],
              }
    
    body = { 
            "Title"     => CONFIG["TITLE"],
            "Description"     => CONFIG["DESCRIPTION"],
            "PageCount"     => CONFIG["PAGE-COUNT"],
            "Excerpt"     =>  CONFIG["EXCERPT"],
            "PublishDate"     => CONFIG["PUBLISH-DATE"],
          }
    
    @response = HTTParty.post(request,
                              :body => body,
                              :headers => header)
                   
  end
  
  def self.readBook
    
    request = CONFIG["URI"]
    
    header = {"Content-Type" => "application/json",
               "Accept" => "application/json"
              }
              
    @response = HTTParty.get(request,
                  :headers => header)           
    
    @lastBook = @response.parsed_response.reverse[0]

    puts @lastBook 
    
  end
  
  def self.changeBookInfo
    
    request = CONFIG["URI"] + "/" + @lastBook['ID'].to_s
    
    
    header = {"Content-Type" => CONFIG["CONTENT-TYPE"],
               "Accept" => CONFIG["ACCEPT"],
              }
    
    body = { 
            "Excerpt"     =>  CONFIG["EXCERPT"]
          }

    puts request 
          
    @response = HTTParty.put(request,
                              :body => body,
                              :headers => header
                            )   
    
  end

  def self.returnResponseCode
    
    return @response.code
    
  end

end 
