from datetime import datetime


DATE_MAP = ('s', 'mns', 'Hrs', 'Days', 'Months', 'Years')


def get_time() -> str:
    dt = datetime(2022, 10, 1, 0, 0, 0)
    delta = dt - datetime.now()
    cleaned_delta = str(delta).replace(' days, ', ':')
    deltas = cleaned_delta.split('.')[0].split(':')
    x = len(deltas)
    stmts = []
    for i in range(x):
        ind = x - 1 - i
        stmt = deltas[i] + DATE_MAP[ind]
        stmts.append(stmt)
    return ' '.join(stmts)
