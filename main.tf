module "vm_with_disk" {
    source = "./module"

    disk_name = "hackdisk"
    compute_name = "hackinstance"
}
