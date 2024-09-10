module "vm_with_disk" {
    source = "./module"

    disk_name = "hack_disk"
    compute_name = "hack_instance"
}