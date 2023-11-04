FROM registry.fedoraproject.org/fedora:rawhide AS nimbus 

COPY system_files /

RUN dnf install -y 'dnf-command(copr)' dnf-plugins-core $(</usr/share/nimbus/pkgs/base) $(</usr/share/nimbus/pkgs/extra) && \
    dnf copr enable atim/nushell -y && \
    dnf copr enable atim/lazygit -y && \
    dnf install -y nushell lazygit && \
    dnf clean all