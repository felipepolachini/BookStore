
Feature: Fake Rest APIs

  @create
  Scenario: Criacao de um Book
    Given Post book info
    Then Book created

  @read  
  Scenario: Read book
    Given Read book info
    Then Book read

  @change  
  Scenario: Alterar um Book
    Given Change book info
    Then Book changed
