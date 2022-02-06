# DB MYSQL

## String functions

1. str1 = "Hello"
2. str2 = "world"
3. title = "This is title!!"

| sno | String function | Description                                                              | Syntax/Example             | O/P             |
| --- | --------------- | ------------------------------------------------------------------------ | -------------------------- | --------------- |
| 1.  | CONCAT          | concatenates two strings                                                 | CONCAT(str1," ",str2)      | "Hello world"   |
| 2.  | CONCAT_WS       | concatenates string, first argument is applied between every two strings | CONCAT_WS("-", str1, str1) | "Hello-world"   |
| 3.  | SUBSTRING       | returns trimmed string                                                   | SUBSTRING(title, 0, 5)     | This            |
| 4.  | REPLACE         | returns trimmed string                                                   | REPLACE(title, " ", "-")   | This-is-title!! |
