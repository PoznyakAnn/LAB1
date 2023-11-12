directory="D:/PZH/pivas" 

if [ ! -d "$directory" ]; then
    echo "Papka not found"
    exit 1
fi

count=0
while read -r -d '' file; do
    ((count++))
done < <(find "$directory" -type f -print0)

result=$((count * $(nproc)))

fileName=$(date +"%S_%M_%H")

echo "$result" > "$directory/$fileName.txt"