Set-Location "C:\Apps\KBBG"
$env:PORT = "8080"

# One—and only one—blocking start command goes here.
# Examples (uncomment ONE and delete the rest):

# & npm run start
# & node server.js
# & dotnet run --urls http://localhost:8080
python -m http.server 8080
