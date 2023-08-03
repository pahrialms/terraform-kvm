terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

############ controller 1
# resource libvirt volume
resource "libvirt_volume" "ms-controller001-vda" {
  name = "ms-controller001-vda.qcow2"
  pool = "vms"
  base_volume_name = "focal-server-cloudimg-amd64.img"
  base_volume_pool = "images"
  format = "qcow2"
  size = "26843046400"
}

# get user data from cloud_init
data "template_file" "user_data1" {
  template = file("${path.module}/cloud_init1.cfg")
}

# get data network from cloud_init
data "template_file" "network_config1" {
  template = file("${path.module}/network_config1.cfg")
}


# resource cloud_init
resource "libvirt_cloudinit_disk" "ms-controller001-cloudinit" {
  name = "ms-controller001-cloudinit.iso"
  user_data = data.template_file.user_data1.rendered
  network_config = data.template_file.network_config1.rendered
  pool = "vms"
}
resource "libvirt_domain" "ms-controller001" {
  name = "ms-controller001"
  description = "This vm created for lab activity"
  cpu {
    mode = "host-passthrough"
    }
  vcpu = 4
  memory = 8096
  disk {
      volume_id = libvirt_volume.ms-controller001-vda.id
      scsi = "true"
  }

  cloudinit = libvirt_cloudinit_disk.ms-controller001-cloudinit.id
  network_interface {
    network_name = "ms-172.18.0"
  }
  network_interface {
    network_name = "ms-172.18.1"
  }
  network_interface {
    network_name = "ms-172.18.2"
  }
  network_interface {
    network_name = "ms-172.18.3"
  }
  network_interface {
    network_name = "ms-172.18.4"
  }

    console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

}

############# controller 2
 resource "libvirt_volume" "ms-controller002-vda" {
  name = "ms-controller002-vda.qcow2"
  pool = "vms"
  base_volume_name = "focal-server-cloudimg-amd64.img"
  base_volume_pool = "images"
  format = "qcow2"
  size = "26843046400"
}

# get user data from cloud_init
data "template_file" "user_data2" {
  template = file("${path.module}/cloud_init2.cfg")
}

# get data network from cloud_init
data "template_file" "network_config2" {
  template = file("${path.module}/network_config2.cfg")
}


# resource cloud_init
resource "libvirt_cloudinit_disk" "ms-controller002-cloudinit" {
  name = "ms-controller002-cloudinit.iso"
  user_data = data.template_file.user_data2.rendered
  network_config = data.template_file.network_config2.rendered
  pool = "vms"
}
resource "libvirt_domain" "ms-controller002" {
  name = "ms-controller002"
  description = "This vm created for lab activity"
  cpu {
    mode = "host-passthrough"
    }
  vcpu = 4
  memory = 8096
  disk {
      volume_id = libvirt_volume.ms-controller002-vda.id
      scsi = "true"
  }

  cloudinit = libvirt_cloudinit_disk.ms-controller002-cloudinit.id
  network_interface {
    network_name = "ms-172.18.0"
  }
  network_interface {
    network_name = "ms-172.18.1"
  }
  network_interface {
    network_name = "ms-172.18.2"
  }
  network_interface {
    network_name = "ms-172.18.3"
  }
  network_interface {
    network_name = "ms-172.18.4"
  }

    console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

}



############# controler 3
 resource "libvirt_volume" "ms-controller003-vda" {
  name = "ms-controller003-vda.qcow2"
  pool = "vms"
  base_volume_name = "focal-server-cloudimg-amd64.img"
  base_volume_pool = "images"
  format = "qcow2"
  size = "26843046400"
}

# get user data from cloud_init
data "template_file" "user_data6" {
  template = file("${path.module}/cloud_init6.cfg")
}

# get data network from cloud_init
data "template_file" "network_config6" {
  template = file("${path.module}/network_config6.cfg")
}


# resource cloud_init
resource "libvirt_cloudinit_disk" "ms-controller003-cloudinit" {
  name = "ms-controller003-cloudinit.iso"
  user_data = data.template_file.user_data6.rendered
  network_config = data.template_file.network_config6.rendered
  pool = "vms"
}
resource "libvirt_domain" "ms-controller003" {
  name = "ms-controller003"
  description = "This vm created for lab activity"
  cpu {
    mode = "host-passthrough"
    }
  vcpu = 4
  memory = 8096
  disk {
      volume_id = libvirt_volume.ms-controller003-vda.id
      scsi = "true"
  }

  cloudinit = libvirt_cloudinit_disk.ms-controller003-cloudinit.id
  network_interface {
    network_name = "ms-172.18.0"
  }
  network_interface {
    network_name = "ms-172.18.1"
  }
  network_interface {
    network_name = "ms-172.18.2"
  }
  network_interface {
    network_name = "ms-172.18.3"
  }
  network_interface {
    network_name = "ms-172.18.4"
  }

    console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

############# 1
# resource libvirt volume 
resource "libvirt_volume" "ms-compute001-vda" {
  name = "ms-compute001-vda.qcow2"
  pool = "vms"
  base_volume_name = "focal-server-cloudimg-amd64.img"
  base_volume_pool = "images"
  format = "qcow2"
  size = "26843046400"  
}  
resource "libvirt_volume" "ms-compute001-vdb" {
  name = "ms-compute001-vdb.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}
resource "libvirt_volume" "ms-compute001-vdc" {
  name = "ms-compute001-vdc.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}
resource "libvirt_volume" "ms-compute001-vdd" {
  name = "ms-compute001-vdd.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}


# get user data from cloud_init
data "template_file" "user_data3" {
  template = file("${path.module}/cloud_init3.cfg")
}

# get data network from cloud_init
data "template_file" "network_config3" {
  template = file("${path.module}/network_config3.cfg")
}

# resource cloud_init
resource "libvirt_cloudinit_disk" "ms-compute001-cloudinit" {
  name = "ms-compute001-cloudinit.iso"
  user_data = data.template_file.user_data3.rendered
  network_config = data.template_file.network_config3.rendered
  pool = "vms"
}  

# resource domain

resource "libvirt_domain" "ms-compute001" {
  name = "ms-compute001"
  description = "This vm created for lab activity"
  cpu {
    mode = "host-passthrough"
    }
  vcpu = 4
  memory = 8096
  disk {
      volume_id = libvirt_volume.ms-compute001-vda.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute001-vdb.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute001-vdc.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute001-vdd.id
      scsi = "true"
  }

  cloudinit = libvirt_cloudinit_disk.ms-compute001-cloudinit.id
  network_interface {
    network_name = "ms-172.18.0"
  }
  network_interface {
    network_name = "ms-172.18.1"
  }
  network_interface {
    network_name = "ms-172.18.2"
  }
  network_interface {
    network_name = "ms-172.18.3"
  }
  network_interface {
    network_name = "ms-172.18.4"
  }
  network_interface {
    network_name = "ms-172.18.5"
  }

    console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
  
}

# 2
resource "libvirt_volume" "ms-compute002-vda" {
  name = "ms-compute002-vda.qcow2"
  pool = "vms"
  base_volume_name = "focal-server-cloudimg-amd64.img"
  base_volume_pool = "images"
  format = "qcow2"
  size = "26843046400"
}
resource "libvirt_volume" "ms-compute002-vdb" {
  name = "ms-compute002-vdb.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}
resource "libvirt_volume" "ms-compute002-vdc" {
  name = "ms-compute002-vdc.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}
resource "libvirt_volume" "ms-compute002-vdd" {
  name = "ms-compute002-vdd.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}
# get user data from cloud_init
data "template_file" "user_data4" {
  template = file("${path.module}/cloud_init4.cfg")
}

# get data network from cloud_init
data "template_file" "network_config4" {
  template = file("${path.module}/network_config4.cfg")
}

# resource cloud_init
resource "libvirt_cloudinit_disk" "ms-compute002-cloudinit" {
  name = "ms-compute002-cloudinit.iso"
  user_data = data.template_file.user_data4.rendered
  network_config = data.template_file.network_config4.rendered
  pool = "vms"
}

# resource domain

resource "libvirt_domain" "ms-compute002" {
  name = "ms-compute002"
  description = "This vm created for lab activity"
  cpu {
    mode = "host-passthrough"
    }
  vcpu = 4
  memory = 8096
  disk {
      volume_id = libvirt_volume.ms-compute002-vda.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute002-vdb.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute002-vdc.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute002-vdd.id
      scsi = "true"
  }
  cloudinit = libvirt_cloudinit_disk.ms-compute002-cloudinit.id
  network_interface {
    network_name = "ms-172.18.0"
  }
  network_interface {
    network_name = "ms-172.18.1"
  }
  network_interface {
    network_name = "ms-172.18.2"
  }
  network_interface {
    network_name = "ms-172.18.3"
  }
  network_interface {
    network_name = "ms-172.18.4"
  }
  network_interface {
    network_name = "ms-172.18.5"
  }

    console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

}

###### 3 #####

resource "libvirt_volume" "ms-compute003-vda" {
  name = "ms-compute003-vda.qcow2"
  pool = "vms"
  base_volume_name = "focal-server-cloudimg-amd64.img"
  base_volume_pool = "images"
  format = "qcow2"
  size = "26843046400"
}
resource "libvirt_volume" "ms-compute003-vdb" {
  name = "ms-compute003-vdb.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}
resource "libvirt_volume" "ms-compute003-vdc" {
  name = "ms-compute003-vdc.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}
resource "libvirt_volume" "ms-compute003-vdd" {
  name = "ms-compute003-vdd.qcow2"
  pool = "vms"
  format = "qcow2"
  size = "16106127360"
}


# get user data from cloud_init
data "template_file" "user_data5" {
  template = file("${path.module}/cloud_init5.cfg")
}

# get data network from cloud_init
data "template_file" "network_config5" {
  template = file("${path.module}/network_config5.cfg")
}

# resource cloud_init
resource "libvirt_cloudinit_disk" "ms-compute003-cloudinit" {
  name = "ms-compute003-cloudinit.iso"
  user_data = data.template_file.user_data5.rendered
  network_config = data.template_file.network_config5.rendered
  pool = "vms"
}

# resource domain

resource "libvirt_domain" "ms-compute003" {
  name = "ms-compute003"
  description = "This vm created for lab activity"
  cpu {
    mode = "host-passthrough"
    }
  vcpu = 4
  memory = 8096
  disk {
      volume_id = libvirt_volume.ms-compute003-vda.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute003-vdb.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute003-vdc.id
      scsi = "true"
  }
  disk {
      volume_id = libvirt_volume.ms-compute003-vdd.id
      scsi = "true"
  }
  cloudinit = libvirt_cloudinit_disk.ms-compute003-cloudinit.id
  network_interface {
    network_name = "ms-172.18.0"
  }
  network_interface {
    network_name = "ms-172.18.1"
  }
  network_interface {
    network_name = "ms-172.18.2"
  }
  network_interface {
    network_name = "ms-172.18.3"
  }
  network_interface {
    network_name = "ms-172.18.4"
  }
  network_interface {
    network_name = "ms-172.18.5"
  }
    console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

}

output "ip-output-compute001" {
  value = [for interface in libvirt_domain.ms-compute001.network_interface : interface.addresses]
}
output "ip-output-compute002" {
  value = [for interface in libvirt_domain.ms-compute002.network_interface : interface.addresses]
}
output "ip-output-compute003" {
  value = [for interface in libvirt_domain.ms-compute003.network_interface : interface.addresses]
}

