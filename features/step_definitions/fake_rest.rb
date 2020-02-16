# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
  
  def self.bookCreated 
    
    if (expect(@response.code).to eql '200')
      
      puts @response.code
      
      puts @response.parsed_response
      
      return true
      
    else
    
      puts @response.code
      
      return false
      
    end
    
  end
  
  
  def self.readBook
    
    request = CONFIG["URI"]
    
    header = {"Content-Type" => "application/json",
               "Accept" => "application/json"
              }
              
    @response = HTTParty.get(request,
                  :headers => header) 
    
    @lastBook = @response.parsed_response.reverse[0]
    
  end
  
  def self.bookRead
    
    if (expect(@response.code).to eql '200')
      puts @response.code
      
      puts @lastBook
      
      return true
      
    else
    
      puts @response.code
      
      return false
      
    end
    
  end
  
  def self.changeBookInfo
    
    request = CONFIG["URI"] + "/" + @lastBook["ID"].to_s
    
    #puts request
    
    header = {"Content-Type" => CONFIG["CONTENT-TYPE"],
               "Accept" => CONFIG["ACCEPT"],
              }
    
    body = { 
            "Title"     => @lastBook["Title"],
            "Description"     => @lastBook["Description"],
            "PageCount"     => @lastBook["PageCount"],
            "Excerpt"     =>  CONFIG["EXCERPT"],
            "PublishDate"     => @lastBook["PublishDate"],
          }
          
    @response = HTTParty.put(request,
                              :body => body,
                              :headers => header
                            )   
    
  end
  
  def self.bookChanged
    
    #if (expect(@response.code).to eql '200')
      if @response.code == 200
      
      puts @response.code
      
      puts @lastBook
      
      return true
      
    else
    
      puts @response.code
      
      return false
      
    end
    
  end
    
    
  end
  
  
