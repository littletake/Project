# dynamic inventory作成
# terraform.tfstate から　inventory.yml　を作成する
# 作成途中
import yaml

# ファイル読み込んでipのリストを返す関数
def create_ip_list(path):
    with open(path) as file:
        tf_info = yaml.load(file, Loader=yaml.FullLoader)
        ip_list = []

        # [host名, public_ip]の組みでまとめる
        for num in range(3):
            host_ip = []
            host_ip.append(tf_info["resources"][num]["name"])
            host_ip.append(tf_info["resources"][num]["instances"][0]["attributes"]["public_ip"])
            ip_list.append(host_ip)

        print(ip_list)
        return ip_list


# # 雛形に情報を入れる関数
# def create_yml(ip_list):
#     original_yml = {
#         all:
# 					children:
# 						k3s_cluster:
# 							children:
# 								master:
# 									hosts:
# 										3.114.7.145:
# 											ansible_ssh_private_key_file: ~/.ssh/math-machine-2
# 											ansible_user: ubuntu
# 											k3s_version: v0.5.0
# 											master_ip: '{{ hostvars[groups[''master''][0]][''ansible_host''] | default(groups[''master''][0])
# 												}}'
# 											systemd_dir: /etc/systemd/system
# 								worker:
# 									hosts:
# 										3.112.84.108:
# 											ansible_ssh_private_key_file: ~/.ssh/math-machine-2
# 											ansible_user: ubuntu
# 											k3s_version: v0.5.0
# 											master_ip: '{{ hostvars[groups[''master''][0]][''ansible_host''] | default(groups[''master''][0])
# 												}}'
# 											systemd_dir: /etc/systemd/system
# 						rancher:
# 							hosts:
# 								3.112.84.108: {}
# 						ungrouped: {}
# 	}


if __name__ == "__main__":
    ip_list = create_ip_list('terraform/terraform.tfstate')
