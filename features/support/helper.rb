module Helper
  
  def takeScrshot(fileName,result)
    
    path = "results/scrshoot/test_#{result}"
    screenshot = "#{path}/#{fileName}.png"
    page.save_screenshot(screenshot)
    embed(screenshot,'image/png','Click Here')
    
  end
  
end
