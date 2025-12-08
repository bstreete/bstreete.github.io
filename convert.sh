#/usr/bin/bash 
name="$1"

if [[ "${name}" == "" ]] ; then 
    echo "No name provided; exiting"
    exit 1
fi

# Process each line here
echo "Processing line: $name"

outfile="${name}.adoc"
infile="${name}.md"

if [[ ! -f "${infile}" ]] ; then 
    echo "Did not find '$infile'; exiting"
    exit 1 
fi 

# Backup on the first write
sed -i.orig -re "s=^title: \"?(.*)\"?=.. title: \1\n.. slug: $name=g" "$infile"
sed -i -re "s=^date: (.*)=.. date: \1=g" "$infile"
sed -i -re "s=^tags: \[(.*)\]=.. tags: \1=g" "$infile"
sed -i -re "s=^author: \[\"(.*)\"\]=.. author: \1=g" "$infile"
sed -i -re "s=^original_link: \"(.*)\"=.. link: \1=g" "$infile"
sed -i -re "s=^cook: \"(.*)\"=.. cooktime: \1=g" "$infile"
sed -i -re "s=^prep: \"(.*)\"=.. preptime: \1=g" "$infile"
sed -i -re "s=^draft: false=.. category: recipes\n.. description: \n.. type: text=g" "$infile"
sed -i -re "s=---=///=g" "$infile"
sed -i -re "s=\"==g" "$infile"

# Insert tables for ingredient lists 
sed -i -re "s_^## Ingredients_## Ingredients\n\n[cols=\"<,<\"]\n|===_g" "$infile"
sed -i -re "s=^-=\|=g" "$infile"
sed -i -re "s_^## Directions_\|===\n\n## Directions_" "$infile"

# Clean up direction lists 
sed -i -re "s=^1\.\s+(.*)=\. \1=g" "$infile"
cp $infile $outfile 
