function remove_unused_packages_fish
    # Run pkg_usage.sh and save the output to a file
    pkg_usage.sh > packages_by_access_time.txt

    # Filter the output to keep only package names and save them to another file
    awk '{print $3}' packages_by_access_time.txt > packages_to_remove.txt

    # Run remove_unused_packages_arg.sh with the packages_to_remove.txt file as an argument
    remove_unused_packages.sh packages_to_remove.txt

    # Clean up temporary files
    rm packages_by_access_time.txt packages_to_remove.txt
end

