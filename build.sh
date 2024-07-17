for i in include/*.haml; do
    base=$(basename -s .haml "$i")
    haml "$i" | sed 's/_/ /g' > include/$base.html
done


for i in pages/*.haml; do
    base=$(basename -s .haml "$i")
    haml "$i" | sed 's/_/ /g' > pages/$base.html
done

haml index.haml | sed 's/_/ /g' | gpp > index.html
