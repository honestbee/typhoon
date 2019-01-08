module "workers" {
  source = "workers"
  name   = "${var.cluster_name}"

  # AWS
  vpc_id          = "${var.vpc_id}"
  subnet_ids      = ["${var.subnet_ids}"]
  security_groups = ["${var.security_groups}"]
  count           = "${var.worker_count}"
  instance_type   = "${var.worker_type}"
  os_image        = "${var.os_image}"
  disk_size       = "${var.disk_size}"
  spot_price      = "${var.worker_price}"

  # configuration
  kubeconfig            = "${module.bootkube.kubeconfig-kubelet}"
  ssh_authorized_key    = "${var.ssh_authorized_key}"
  service_cidr          = "${var.service_cidr}"
  cluster_domain_suffix = "${var.cluster_domain_suffix}"
  clc_snippets          = "${var.worker_clc_snippets}"
}
