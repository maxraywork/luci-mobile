class PodkopInterface {
  final bool anonymous;
  final String type;
  final String name;
  final int index;
  final String mode;
  final String proxyConfigType;
  final String domainListEnabled;
  final String subnetsListEnabled;
  final String customDomainsListType;
  final String customLocalDomainsListEnabled;
  final String customDownloadDomainsListEnabled;
  final String customDownloadSubnetsListEnabled;
  final String allTrafficFromIpEnabled;
  final String delistDomainsEnabled;
  final String excludeFromIpEnabled;
  final String yacd;
  final String socks5;
  final String excludeNtp;
  final String quicDisable;
  final String dontTouchDhcp;
  final String updateInterval;
  final String dnsType;
  final String dnsServer;
  final String dnsRewriteTtl;
  final String cacheFile;
  final List<String> iface;
  final String monRestartIfaces;
  final String ssUot;
  final String detour;
  final String proxyString;
  final String customSubnetsListEnabled;
  final List<String> domainList;

  PodkopInterface({
    required this.anonymous,
    required this.type,
    required this.name,
    required this.index,
    required this.mode,
    required this.proxyConfigType,
    required this.domainListEnabled,
    required this.subnetsListEnabled,
    required this.customDomainsListType,
    required this.customLocalDomainsListEnabled,
    required this.customDownloadDomainsListEnabled,
    required this.customDownloadSubnetsListEnabled,
    required this.allTrafficFromIpEnabled,
    required this.delistDomainsEnabled,
    required this.excludeFromIpEnabled,
    required this.yacd,
    required this.socks5,
    required this.excludeNtp,
    required this.quicDisable,
    required this.dontTouchDhcp,
    required this.updateInterval,
    required this.dnsType,
    required this.dnsServer,
    required this.dnsRewriteTtl,
    required this.cacheFile,
    required this.iface,
    required this.monRestartIfaces,
    required this.ssUot,
    required this.detour,
    required this.proxyString,
    required this.customSubnetsListEnabled,
    required this.domainList,
  });

  factory PodkopInterface.fromJson(Map<String, dynamic> json) {
    return PodkopInterface(
      anonymous: json['.anonymous'] as bool,
      type: json['.type'] as String,
      name: json['.name'] as String,
      index: json['.index'] as int,
      mode: json['mode'] as String,
      proxyConfigType: json['proxy_config_type'] as String,
      domainListEnabled: json['domain_list_enabled'] as String,
      subnetsListEnabled: json['subnets_list_enabled'] as String,
      customDomainsListType: json['custom_domains_list_type'] as String,
      customLocalDomainsListEnabled: json['custom_local_domains_list_enabled'] as String,
      customDownloadDomainsListEnabled: json['custom_download_domains_list_enabled'] as String,
      customDownloadSubnetsListEnabled: json['custom_download_subnets_list_enabled'] as String,
      allTrafficFromIpEnabled: json['all_traffic_from_ip_enabled'] as String,
      delistDomainsEnabled: json['delist_domains_enabled'] as String,
      excludeFromIpEnabled: json['exclude_from_ip_enabled'] as String,
      yacd: json['yacd'] as String,
      socks5: json['socks5'] as String,
      excludeNtp: json['exclude_ntp'] as String,
      quicDisable: json['quic_disable'] as String,
      dontTouchDhcp: json['dont_touch_dhcp'] as String,
      updateInterval: json['update_interval'] as String,
      dnsType: json['dns_type'] as String,
      dnsServer: json['dns_server'] as String,
      dnsRewriteTtl: json['dns_rewrite_ttl'] as String,
      cacheFile: json['cache_file'] as String,
      iface: List<String>.from(json['iface'] as List),
      monRestartIfaces: json['mon_restart_ifaces'] as String,
      ssUot: json['ss_uot'] as String,
      detour: json['detour'] as String,
      proxyString: json['proxy_string'] as String,
      customSubnetsListEnabled: json['custom_subnets_list_enabled'] as String,
      domainList: List<String>.from(json['domain_list'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '.anonymous': anonymous,
      '.type': type,
      '.name': name,
      '.index': index,
      'mode': mode,
      'proxy_config_type': proxyConfigType,
      'domain_list_enabled': domainListEnabled,
      'subnets_list_enabled': subnetsListEnabled,
      'custom_domains_list_type': customDomainsListType,
      'custom_local_domains_list_enabled': customLocalDomainsListEnabled,
      'custom_download_domains_list_enabled': customDownloadDomainsListEnabled,
      'custom_download_subnets_list_enabled': customDownloadSubnetsListEnabled,
      'all_traffic_from_ip_enabled': allTrafficFromIpEnabled,
      'delist_domains_enabled': delistDomainsEnabled,
      'exclude_from_ip_enabled': excludeFromIpEnabled,
      'yacd': yacd,
      'socks5': socks5,
      'exclude_ntp': excludeNtp,
      'quic_disable': quicDisable,
      'dont_touch_dhcp': dontTouchDhcp,
      'update_interval': updateInterval,
      'dns_type': dnsType,
      'dns_server': dnsServer,
      'dns_rewrite_ttl': dnsRewriteTtl,
      'cache_file': cacheFile,
      'iface': iface,
      'mon_restart_ifaces': monRestartIfaces,
      'ss_uot': ssUot,
      'detour': detour,
      'proxy_string': proxyString,
      'custom_subnets_list_enabled': customSubnetsListEnabled,
      'domain_list': domainList,
    };
  }
}