
Feature: Fake Rest APIs

  @create
  Scenario: Criacao de um Book
    Given Post book info
    Then API Success

  @read  
  Scenario: Read last book
    Given Read book info 
    Then API Success

  @change  
  Scenario: Change last Book
    Given Change book info 
    Then API Success
