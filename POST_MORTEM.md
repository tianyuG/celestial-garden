# Post Mortem of Celestial Garden

- [Post Mortem of Celestial Garden](#post-mortem-of-celestial-garden)
  - [Software](#software)
    - [Testing](#testing)
    - [Networking](#networking)
  - [Hardware](#hardware)
    - [Twisting Motion](#twisting-motion)
    - [Structural fittings inside the buoys](#structural-fittings-inside-the-buoys)

## Software

### Testing

The majority of code for Celestial Garden worked without any modification due to testing before the event. However, some modifications were made to accommodate the environment and the observed interactivity from the audience and visitors.

The brightness of ambient lighting was of concern initially during the setup. The brightness of the lightstrips were originally a concern as they start really bright and gets brighter when a bump is registered, I was concerned that all 16 of them would be too bright for the visitors. However, as the installation is next to a window and the weather in DC has mostly been sunny or overcast, the brightness eventually worked well.

On the first day of the opening, we had to shut down the installation twice, amounting to around two hours of downtime, due to the damage to wooden frame inside the buoys. A few of the audience members were aggressive towards the installation, and even though the fabric buoy was inflated and provided some degrees of protection towards the innards, the some of the wooden frames inside the buoys were still broken by the excessive force. One of such instance was caught on tape as my colleague happened to be recording the even as part of their documentation. We have increased the amount of helpers to be vigilant and proactively intervene when an audience member gets too excited by the installation, and work on patching up any broken wooden frames or fabric before the museum reopens.

I have considered altering the established interactivity in order to reduce the amount of aggressive behaviours. I considered making the lighting changes more subtle, and even reducing the volume of the speaker; however these ideas will significantly alter the installation from the original vision, so they were only considered as a last resort.

### Networking

The Arduino boards implement a feature so that a board can be rebooted remotely. A few of the boards were unresponsive on the last day of the exhibition and no longer respond to network diagnostics messages, so those boards had to be manually rebooted by unplugging and re-plugging the ethernet cable. As the ethernet cable also supplies power (split to ethernet data and Micro USB power), unplugging the ethernet cable would effectively cut the power to the board.

When the network switch is rebooted, the digital audio interface would reassign the inlet/outlet numbers. This has caused confusions on the last day of exhibition as it was difficult to figure out the new mapping after the reassignments.

## Hardware

### Twisting Motion

One observation we had was that the twisting motion from the visitors, either unintentionally (walking pass in between the pods and the pods become twisted from friction; the air flow can possibly also introduce static electricity that would make the unintentional twisting more likely to occur) or intentionally. The twisting induces more harm than punching in several ways. An obvious issue relates to how the pods become inflated. By twisting the pods, the soft fabric tube that connects the pods to the air ducts will also be constrained, and the air flow into the pods will be obstructed until the twisting is undone. This will lead to temporary deflation to the pods, and expose the rigid innards to the visitors. This deflation will make the pods more vulnerable to the interaction, as without the counteracting pressure that keeps the pods inflated, the fabric can be more susceptible to damage (nails, for example).

For future iterations, we need to consider if more reinforcement is needed for the fabric air tube. It still needs to be soft enough to allow flexible movements, but the hardware design should also consider the longer-term effects of the twisting motion. In addition to hardware iterations, we should also consider what can be done in the area of interactivity to discourage intentional twisting.

### Structural fittings inside the buoys

The first downtime on day one was caused by loosen screws and wingnuts. We suspected that this was caused by the repeated bashing and excessive swinging from the visitors. As we did not have loctites at hand, we resorted to simply tighten up the fixture and then reenforce the structure with zip ties. This procedure involves threading the zip tie through some of the holes on the pvc pipes and tie down around the wooden piece that provides structural support to the either sides of the wooden frame.

The second (and last) downtime on day one was caused by the destruction of the wooden frames inside the buoys. The bottom of the wooden frame, which were cushioned by a plastic foam plate so it can tether to the end of the fabric sleeve with a screw, become detached from the glued sides of the wooden frame. We observed a visitor kicking one of the buoys (number 3) aggressively and caused the wooden frame to snap in halves in addition to the detachment of its bottom plate. While the emergency fix for the first downtime provided more stability to the wooden frame itself, it may have inadvertently weakened the wooden frame, as one of the endpoints for the zip tie was on the wooden support piece. Even though the zip ties held the wooden frame to the pvc pipe, over time the tension may have weakened the glue that holds the support piece in place and led to more damages.

We had resorted to use gorilla tapes to reinforce wooden frames before the exhibition opened on Sunday. This had strengthened the installation and we had not experienced additional downtimes for the rest of our exhibition.