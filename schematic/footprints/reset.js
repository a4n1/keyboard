module.exports = {
    params: {
        designator: 'S', // for Switch
        side: 'B',
        from: {type: 'net', value: 'from'},
        to: {type: 'net', value: 'to'}
    },
    body: p => `

    (module b3u1000p (layer F.Cu) (tstamp 5BF2CC94)

        ${p.at /* parametric position */}

        ${'' /* pins */}
        (pad 1 smd rect (at 1.7 0 ${p.rot}) (size 0.9 1.7) (layers ${p.side}.Cu ${p.side}.Paste ${p.side}.Mask) ${p.from.str})
        (pad 2 smd rect (at -1.7 0 ${p.rot}) (size 0.9 1.7) (layers ${p.side}.Cu ${p.side}.Paste ${p.side}.Mask) ${p.to.str})
    )

    `
}
