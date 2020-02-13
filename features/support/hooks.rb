
After do |scenario|
 
    scenarioName = scenario.name.gsub('/\s+','_').tr('/','_')
    
    if scenario.failed?
      takeScrshot(scenarioName.downcase!,'failed')
    else
      takeScrshot(scenarioName.downcase!,'passed')
    end  
 
end



