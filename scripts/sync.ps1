$files = Get-ChildItem "./data/cityenviron/aerial/train-10000/images"
$cnt = 0
for ($i=0; $i -lt $files.Count; $i++) {
    $name = $files[$i].FullName | Resolve-Path -Relative
    git add $name
    $cnt++

    if ($cnt -eq 10) {
        git commit -m "Sync aerial data"
        git push origin main --force
        $cnt = 0
    }
}

$files = Get-ChildItem "./data/cityenviron/aerial"
for ($i=0; $i -lt $files.Count; $i++) {
    $name = $files[$i].FullName | Resolve-Path -Relative
    # Write-Output $name
    git add $name
    git commit -m "Sync aerial data"
    git push origin main --force
}

git add .
git commit -m "s"
git push origin main --force

# git add data/cityenviron/aerial/dust-10
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/dust-100
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/dust-1000
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/fog-10
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/fog-100
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/fog-1000
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/maple_leaf-10
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/maple_leaf-100
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/maple_leaf-1000
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/rain-10
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/rain-100
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/rain-1000
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/snow-10
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/snow-100
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/snow-1000
# git commit -m "Sync aerial data"
# git push origin main --force


# git add data/cityenviron/aerial/test
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/train-10000
# git commit -m "Sync aerial data"
# git push origin main --force

# git add data/cityenviron/aerial/val
# git commit -m "Sync aerial data"
# git push origin main --force

# git add .
# git commit -m "Sync aerial data"
# git push origin main --force