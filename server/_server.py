import os, sys, json, time, subprocess, base64, threading, jinja2, psutil, logging, aiohttp_jinja2, aiodns, pathlib, aiohttp, asyncio
from datetime import datetime
from aiocache import cached, Cache
from aiocache.serializers import PickleSerializer
from collections import namedtuple
from aiohttp import web

logging.warning("User clicked a button", extra={"user": 123})

HOST = os.getenv('HOST', '0.0.0.0')
PORT = int(os.getenv('PORT', 50009))
STATIC_PATH = "{}/static".format(os.path.dirname(os.path.realpath(__file__)))
TEMPLATE_PATH = "{}/templates".format(os.path.dirname(os.path.realpath(__file__)))
THIS_PROCESS = psutil.Process()
IS_SHUTTING_DOWN = False
logging.warning("[cached_handler_get]",extra={"server_id": 123})

async def on_shutdown(app):
    logging.warning("[on_shutdown]")

async def run_command(cmd, EXECUTE_PROCESS_IN_SHELL=False):
    #print("[run_command] cmd type: {}, cmd: {}".format(type(cmd),cmd))
    if EXECUTE_PROCESS_IN_SHELL:
        process = await asyncio.create_subprocess_shell(cmd, stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE)
    else:
        process = await asyncio.create_subprocess_exec(cmd, stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE)
    stdout, stderr = await process.communicate()
    return {
        "pid": process.pid,
        "exit_code": process.returncode,
        "stdout": stdout.decode().strip(),
        "stderr": stderr.decode().strip(),
    }

async def browserOpen(request):
    url = request.headers['URL']
    url_decoded = base64.urlsafe_b64decode(url).decode()
    dat = {}
    #print("[browserOpen] request.headers: {}".format(request.headers))
    #print("[browserOpen] url: {}".format(url))
    #print("[browserOpen] url_decoded: {}".format(url_decoded))
    CHROME_BIN = '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    CHROME_ARGS = ['--profile-directory=test5',url_decoded]
    CHROME_COMMAND = CHROME_BIN + ' ' + ' '.join(CHROME_ARGS)
    #print("[browserOpen] CHROME_COMMAND: {}".format(CHROME_COMMAND))
    out = await run_command(CHROME_COMMAND, True)
    #print("[browserOpen] process response: {}\n\n".format(out))
    return aiohttp.web.Response(text='Browser Opened')


def initThreads(app):
    pass

def initRoutes(app):
    app.router.add_static('/static/', path=STATIC_PATH, name='static')
    app.router.add_route('GET', '/browser/open', browserOpen)
    app.router.add_static("/", "{}/static".format(pathlib.Path(__file__).parent), show_index=True)

def initAppObjects(app):
    app["cache"] = Cache(Cache.MEMORY)
    app["resolver"] = aiodns.DNSResolver(app.loop)

def initCleanups(app):
    app.on_shutdown.append(on_shutdown)

def initApp():
    app = web.Application()
    aiohttp_jinja2.setup(app, loader=jinja2.FileSystemLoader(TEMPLATE_PATH))
    return app


def main():
    app = initApp()
    initAppObjects(app)
    initRoutes(app)
    initThreads(app)
    initCleanups(app)

    try:
        aiohttp.web.run_app(app, host=HOST, port=PORT)
    except Exception as e:
        print(e)
        sys.exit(1)

if __name__ == '__main__':
    main()





