LIX of Danish, Swedish and Norwegian Speeches
---

### Description

Collection of calculated LIX of speeches delivered by Danish, Swedish and Norwegian Prime Ministers at the opening of parliament, New Year Addresses delivered by the King or Queen of Denmark, the King of Norway, the Prime Minister of Denmark and the Prime Minister of Norway and Christmas Addresses delivered by the King of Sweden.

### What is LIX?

LIX is a readability measure commonly used in Scandinavia. The higher the LIX rating, the harder the text is considered to be. The measure was developed by Swedish scholar Carl-Hugo Björnsson. The LIX readability formula is as follows:

LIX = A / B + (C * 100) / A, where

A is the number of words,

B is the number of sentences, and

C is the number of long words (more than 6 letters).

| LIX   | Difficulty | Examples                          |
| ----- | ---------- | --------------------------------- |
| >55   | Very hard  | Academic journals, legal texts    |
| 45-55 | Hard       | Public documents, popular science |
| 35-44 | Moderate   | Newspapers, magazines             |
| 25-34 | Easy       | Fiction, tabloids                 |
| <25   | Very easy  | Children's literature             |

### Repository content

The `lix.csv` data file consists of the following variables:

- `year` = Year the speech was delivered
- `date` = Date the speech was delivered, format: yyyy-mm-dd
- `country` = Country in which the speech was delivered (Denmark, Sweden, Norway)
- `occasion` = Occasion of the speech (Opening of Parliament, New Year, Christmas)
- `speaker_role` = Role of the speaker (Prime Minister, Monarch)
- `speaker_name` = Name of the speaker
- `lix` = LIX score of the speech

The following command will load the data into R:

``` R
read.csv(url("https://raw.githubusercontent.com/Straubinger/lix/master/lix.csv"))
```

All of the speeches used to compute LIX can be found as txt files in their respective folders. All speeches delivered by Prime Ministers have the initials of the Prime Minister delivering the speech as part of the filename together with the year the speech was delivered. E.g. the New Year Address delivered in 2001 by then Prime Minister of Denmark Poul Nyrup Rasmussen is named 2001PNR.
