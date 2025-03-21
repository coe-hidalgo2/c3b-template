site_configuration = {
    'systems': [
        {
            'name': 'codespace_machine',
            'descr': 'GitHub Codespace Machine',
            'hostnames':['py::socket.gethostname'],
            'partitions': [
                {
                    'name': 'my_partition',
                    'scheduler': 'local',
                    'launcher': 'local',
                    'environs': ['my_environment'],
                    'processor': { 'num_cpus': 1 }
                }
            ]
        }
    ],
    'environments':[
        {
            'name': 'my_environment',
            'target_systems': ["codespace_machine:my_partition"]
        }
    ]
}