from omero.cli import cli_login

with cli_login("root@omero", "-womero") as cli:
    cli.loadplugins()
    cli.invoke(["import", "/data/hcs.fake", "---file=/tmp/import.out"])
    with open("/tmp/import.out", "r") as o:
        output = o.read().strip()
    cli.invoke(["zarr", "export", output])
